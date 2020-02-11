contract c {
    function set(uint key) public returns(bool) {
        data[key] = msg.data;
        return true;
    }

    function copy(uint from, uint to) public returns(bool) {
        data[to] = data[from];
        return true;
    }
    mapping(uint => bytes) data;
}

// ----
// set(uint256): 1, 2 -> true
// set(uint256):"1, 2" -> "1"
// set(uint256): 2, 2, 3, 4, 5 -> true
// set(uint256):"2, 2, 3, 4, 5" -> "1"
// copy(uint256,uint256): 1, 2 -> true
// copy(uint256,uint256):"1, 2" -> "1"
// copy(uint256,uint256): 99, 1 -> true
// copy(uint256,uint256):"99, 1" -> "1"
// copy(uint256,uint256): 99, 2 -> true
// copy(uint256,uint256):"99, 2" -> "1"
