pragma experimental ABIEncoderV2;
contract C {
    struct S {
        uint a;
        uint[] b;
    }

    function f0() public pure returns(bytes memory) {
        return abi.encode();
    }

    function f1() public pure returns(bytes memory) {
        return abi.encode(1, 2);
    }

    function f2() public pure returns(bytes memory) {
        string memory x = "abc";
        return abi.encode(1, x, 2);
    }

    function f3() public pure returns(bytes memory r) {
        // test that memory is properly allocated
        string memory x = "abc";
        r = abi.encode(1, x, 2);
        bytes memory y = "def";
        require(y[0] == "d");
        y[0] = "e";
        require(y[0] == "e");
    }
    S s;

    function f4() public returns(bytes memory r) {
        string memory x = "abc";
        s.a = 7;
        s.b.push(2);
        s.b.push(3);
        r = abi.encode(1, x, s, 2);
        bytes memory y = "def";
        require(y[0] == "d");
        y[0] = "e";
        require(y[0] == "e");
    }
}

// ----
// f0() -> 0x20, 0
// f0():"" -> "32, 0"
// f1() -> 0x20, 0x40, 1, 2
// f1():"" -> "32, 64, 1, 2"
// f2() -> 0x20, 0xa0, 1, 0x60, 2, 3, "abc"
// f2():"" -> "32, 160, 1, 96, 2, 3, abc"
// f3() -> 0x20, 0xa0, 1, 0x60, 2, 3, "abc"
// f3():"" -> "32, 160, 1, 96, 2, 3, abc"
// f4() -> 0x20, 0x160, 1, 0x80, 0xc0, 2, 3, "abc", 7, 0x40, 2, 2, 3
// f4():"" -> "32, 352, 1, 128, 192, 2, 3, abc, 7, 64, 2, 2, 3"
