// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP. Does not include
 * the optional functions; to access them see {ERC20Detailed}.
 */
 /**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     * - Subtraction cannot overflow.
     *
     * _Available since v2.4.0._
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     * - The divisor cannot be zero.
     *
     * _Available since v2.4.0._
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

/*
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with GSN meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
contract Context {
    // Empty internal constructor, to prevent people from mistakenly deploying
    // an instance of this contract, which should be used via inheritance.
    constructor (){ }
    // solhint-disable-previous-line no-empty-blocks

    function _msgSender() internal view returns (address) {
        return msg.sender;
    }

    function _msgData() internal view returns (bytes memory) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
interface TRC721 {
    // Returns the number of NFTs owned by the given account
    function balanceOf(address _owner) external view returns (uint256);

    //Returns the owner of the given NFT
    function ownerOf(uint256 _tokenId) external view returns (address);

    //Transfer ownership of NFT
    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes calldata data) external payable;

    //Transfer ownership of NFT
    function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;

    //Transfer ownership of NFT
    function transferFrom(address _from, address _to, uint256 _tokenId) external payable;

    //Grants address ‘_approved’ the authorization of the NFT ‘_tokenId’
    function approve(address _approved, uint256 _tokenId) external payable;

    //Grant/recover all NFTs’ authorization of the ‘_operator’
    function setApprovalForAll(address _operator, bool _approved) external;

    //Query the authorized address of NFT
    function getApproved(uint256 _tokenId) external view returns (address);

    //Query whether the ‘_operator’ is the authorized address of the ‘_owner’
    function isApprovedForAll(address _owner, address _operator) external view returns (bool);

    //The successful ‘transferFrom’ and ‘safeTransferFrom’ will trigger the ‘Transfer’ Event
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);

    //The successful ‘Approval’ will trigger the ‘Approval’ event
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);

    //The successful ‘setApprovalForAll’ will trigger the ‘ApprovalForAll’ event
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

  }
interface TRC721TokenReceiver {
     //This method will be triggered when the ‘_to’ is the contract address during the ‘safeTransferFrom’ execution, and the return value must be checked, If the return value is not bytes4(keccak256("onTRC721Received(address,address,uint256,bytes)")) throws an exception. The smart contract which can receive NFT must implement the TRC721TokenReceiver interface.
       function onTRC721Received(address _operator, address _from, uint256 _tokenId, bytes calldata _data) external returns(bytes4);
   }
   
contract Main is Context{
    address public owner;
    address public token;
    uint256 public initialPrice;
    uint256 public multiplier;
    uint256 public tax;
    uint256 public counter;
    uint256 public roundNumber;
    address public EquityOwner;
    address public taxAddr;
    address public officialReceiver;
    
    address public NFT;
    uint256 public prizeId;
    uint256 public repurchasePrice;

    uint256 public maxNumber;
    address public winner;
    
    mapping(address=>uint256) public userTimes; // period number => user => frequency
    uint256 public endRound=100;
    
    using SafeMath for uint256;
    
    
    constructor (address token_, address taxAddr_){
        owner = _msgSender();
        EquityOwner = address(this);
        taxAddr = taxAddr_;
        initialPrice = 100;
        multiplier = 5;
        tax = 1;
        token = token_ ; // precision 6
        maxNumber = 1;
        winner = address(this);
    }
    
    modifier onlyOwner{
        require(_msgSender()==owner,"only owner");
        _;
    }
    
    /*
    * transfer token balance to a certain account in emergency.
    */
    function fundTransfer(address fundAddr) onlyOwner public{
        uint tempBalance = IERC20(token).balanceOf(address(this));
        IERC20(token).transfer(fundAddr, tempBalance);
    }
    
    /*
    * set global parameters, only owner
    */
    function setEndRound(uint256 n) onlyOwner public{
        require(roundNumber<n,"invalid parameters");
        endRound=n;
    }
    
    function setInitialPrice(uint256 initialPrice_) onlyOwner public{
        initialPrice = initialPrice_;
    }
    
    function setNFTaddr(address NFTaddr) onlyOwner public{
        NFT = NFTaddr;
    }
    
    function setOfficialReceiver(address officialReceiver_) onlyOwner public{
        officialReceiver = officialReceiver_;
    }
    
    function setAwardNFT(uint256 prizeId_, uint256 repurchasePrice_) onlyOwner public{
        prizeId = prizeId_;
        repurchasePrice = repurchasePrice_;
    }
    
    function transferOwnership(address newOwner_) onlyOwner public{
        owner = newOwner_;
    }
    
    function calculatePayment() public view returns(uint256, uint256){
        uint256 currentPrice = initialPrice.mul((100 + multiplier)**(counter.add(1))).mul(1e6).div(100**counter.add(1));
        uint256 taxFee = initialPrice.mul((100 + multiplier)**(counter)).mul(1e6).div(100**counter).mul(tax).div(100);
        
        return (currentPrice,taxFee);
    }
    
    
    /*
    * customers buy NFT equity
    */
    function buy() public{
        require(_msgSender()!=EquityOwner, "cannot trade yourself");
        require(roundNumber<=endRound,"end of this activity");
        
        uint256 currentPrice = initialPrice.mul((100 + multiplier)**(counter.add(1))).mul(1e6).div(100**counter.add(1));
        uint256 taxFee = initialPrice.mul((100 + multiplier)**(counter)).mul(1e6).div(100**counter).mul(tax).div(100);
        
        IERC20(token).transferFrom(_msgSender(),taxAddr,taxFee);
        IERC20(token).transferFrom(_msgSender(),EquityOwner,currentPrice);
        
        EquityOwner = _msgSender();
        counter = counter.add(1);
        
        if(counter==99){
            IERC20(token).transfer(_msgSender(),currentPrice.mul(100+multiplier).div(100));
            EquityOwner = address(this);
            roundNumber = roundNumber.add(1);
            counter = 0;
        }
        
        
        userTimes[_msgSender()] += 1;

        if(userTimes[_msgSender()] > maxNumber){
          winner = _msgSender();
        }
        
    }
    
    
    function repurchase() public{
        require(TRC721(NFT).ownerOf(prizeId)==_msgSender(), "must be the owner of this NFT");
        TRC721(NFT).safeTransferFrom(_msgSender(), officialReceiver, prizeId);
        IERC20(token).transfer(_msgSender(),repurchasePrice);
    }
    
    
   
    
    
    
}