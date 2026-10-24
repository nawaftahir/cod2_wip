short ShortSwap(short l) { unsigned char b1 = l & 255, b2 = (l >> 8) & 255; return (b1 << 8) + b2; }
