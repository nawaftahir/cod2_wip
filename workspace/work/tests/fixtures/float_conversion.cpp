// Probe the original compiler's integer conversion, not reconstructed game code.
extern "C" int PlainFloatToInt(float value)
{
    return (int)value;
}

extern "C" int BiasedFloatToInt(float value)
{
    const double bias = 0.5 - 1.0 / (1 << 30);
    return (int)((double)value - bias);
}
