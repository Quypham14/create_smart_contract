import brownie

def test_swap_tokens(uniswap_v2, accounts):
    # Lấy một đối tượng của smart contract UniswapV2
    contract = uniswap_v2.deploy({'from': accounts[0]})
    # Ví dụ: Kiểm tra việc hoán đổi token và kiểm tra kết quả
    
    # Gọi hàm swap_tokens
    tx = contract.swap_tokens({'from': accounts[0]})
    
    # Kiểm tra sự thay đổi sau khi hoán đổi
    assert tx.events["SwapCompleted"]["amount_in"] > 0
    assert tx.events["SwapCompleted"]["amount_out"] > 0

