contract C {
    mapping (uint => uint) m;
    uint a = 1000 m;
}
// ----
// TypeError 5704: (56-62): This object cannot be used as a literal suffix.
