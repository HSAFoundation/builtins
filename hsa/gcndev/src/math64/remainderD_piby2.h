
// Reduction for medium sized arguments
static inline void
remainder_piby2_medium(double x, double *r, double *rr, int *regn)
{
    // How many pi/2 is x a multiple of?
    const double two_by_pi = 0x1.45f306dc9c883p-1;
    double dnpi2 = trunc(fma(x, two_by_pi, 0.5));

    const double piby2_h = -7074237752028440.0 / 0x1.0p+52;
    const double piby2_m = -2483878800010755.0 / 0x1.0p+105;
    const double piby2_t = -3956492004828932.0 / 0x1.0p+158;

    // Compute product of npi2 with 159 bits of 2/pi
    double p_hh = piby2_h * dnpi2;
    double p_ht = fma(piby2_h, dnpi2, -p_hh);
    double p_mh = piby2_m * dnpi2;
    double p_mt = fma(piby2_m, dnpi2, -p_mh);
    double p_th = piby2_t * dnpi2;
    double p_tt = fma(piby2_t, dnpi2, -p_th);

    // Reduce to 159 bits
    double ph = p_hh;
    double pm = p_ht + p_mh;
    double t = p_mh - (pm - p_ht);
    double pt = p_th + t + p_mt + p_tt;
    t = ph + pm; pm = pm - (t - ph); ph = t;
    t = pm + pt; pt = pt - (t - pm); pm = t;

    // Subtract from x
    t = x + ph;
    double qh = t + pm;
    double qt = pm - (qh - t) + pt;

    *r = qh;
    *rr = qt;
    *regn = (int)dnpi2 & 0x3;
}

static inline void
remainder_piby2_large(double x, double *r, double *rr, int *regn)
{
    double p3 = __amdil_trig_preop(x, 0);
    double p2 = __amdil_trig_preop(x, 1);
    double p1 = __amdil_trig_preop(x, 2);
    double p0 = __amdil_trig_preop(x, 3);

    // Account for preop scaling
    x = __amdil_ldexp_f64(x, x >= 0x1.0p+945 ? -128 : 0);

    // Exact multiply
    double f3 = p3 * x;
    double f3l = fma(p3, x, -f3);
    double f2h = p2 * x;
    double f2l = fma(p2, x, -f2h);
    double f1h = p1 * x;
    double f1l = fma(p1, x, -f1h);

    // Collapse to 4 doubles
    double f2 = f3l + f2h;
    double g2l = f2h - (f2 - f3l);
    double g1h = f2l + f1h;
    double g1l = f1h - (g1h - f2l);
    double g0h = fma(p0, x, f1l);
    double f1 = g2l + g1h;
    double f0 = g1h - (f1 - g2l);
    double h0h = g1l + g0h;
    f0 += h0h;

    // Strip off unwanted large integer bits
    f3 = __amdil_ldexp_f64(__amdil_fraction_f64(__amdil_ldexp_f64(f3, -16)), 16);

    // Don't let it go negative
    f3 += f3+f2 < 0.0 ? 0x1.0p+16 : 0.0;

    // Now the remaining integer 
    int i = (int)(f3 + f2);
    f3 -= (double)i;

    // Shift up
    double s, t;
    s = f3 + f2; t = f2 - (s - f3); f3 = s; f2 = t;
    s = f2 + f1; t = f1 - (s - f2); f2 = s; f1 = t;
    f1 += f0;

    // if fraction >= 1/2, increment i and subtract 1 from f
    int g = f3 >= 0.5;
    i += g;
    f3 -= g;

    // Final shift up
    s = f3 + f2; t = f2 -(s - f3); f3 = s; f2 = t + f1;

    // Scale fraction by py/2
    const double p2h = 7074237752028440.0 / 0x1.0p+52;
    const double p2t = 4967757600021510.0 / 0x1.0p+106;
    double rhi = f3 * p2h;
    double rlo = fma(f2, p2h, fma(f3, p2t, fma(f3, p2h, -rhi)));

    // Normalize
    s = rhi + rlo;
    rlo = rlo - (s - rhi);
    rhi = s;
    i &= 0x3;

    // This process isn't the identity for values <= pi/4, correct here
    const double piby4 = 0x1.921fb54442d18p-1;
    int c = x <= piby4;

    *r = c ? x : rhi;
    *rr = c ? 0.0 : rlo;
    *regn = c ? 0 : i;
}

