contract C {
    int public a = -0x42 << 8;
}

// ----
// a() -> -0x4200
// a():"" -> "115792089237316195423570985008687907853269984665640564039457584007913129623040"
