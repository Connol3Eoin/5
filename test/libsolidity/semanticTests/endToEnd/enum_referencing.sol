interface I {
    enum Direction {
        A,
        B,
        Left,
        Right
    }
}
library L {
    enum Direction {
        Left,
        Right
    }

    function f() public pure returns(Direction) {
        return Direction.Right;
    }

    function g() public pure returns(I.Direction) {
        return I.Direction.Right;
    }
}
contract C is I {
    function f() public pure returns(Direction) {
        return Direction.Right;
    }

    function g() public pure returns(I.Direction) {
        return I.Direction.Right;
    }

    function h() public pure returns(L.Direction) {
        return L.Direction.Right;
    }

    function x() public pure returns(L.Direction) {
        return L.f();
    }

    function y() public pure returns(I.Direction) {
        return L.g();
    }
}

// ----
// f() -> 1
// f():"" -> "1"
// g() -> 3
// g():"" -> "3"

interface I {
    enum Direction {
        A,
        B,
        Left,
        Right
    }
}
library L {
    enum Direction {
        Left,
        Right
    }

    function f() public pure returns(Direction) {
        return Direction.Right;
    }

    function g() public pure returns(I.Direction) {
        return I.Direction.Right;
    }
}
contract C is I {
    function f() public pure returns(Direction) {
        return Direction.Right;
    }

    function g() public pure returns(I.Direction) {
        return I.Direction.Right;
    }

    function h() public pure returns(L.Direction) {
        return L.Direction.Right;
    }

    function x() public pure returns(L.Direction) {
        return L.f();
    }

    function y() public pure returns(I.Direction) {
        return L.g();
    }
}

// ----
// f() -> 3
// f():"" -> "3"
// g() -> 3
// g():"" -> "3"
// h() -> 1
// h():"" -> "1"
// x() -> 1
// x():"" -> "1"
// y() -> 3
// y():"" -> "3"
