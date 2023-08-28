// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NZPoliticalPoll2023 {
    // Define the parties
    enum Party { National, Labour, Greens, NZFirst, ACT, Freedom, TOP }

    // Store the votes
    mapping(Party => uint256) public votes;

    // Store if an address has voted
    mapping(address => bool) public hasVoted;

    // Vote event
    event Voted(address indexed voter, Party chosenParty);

    // Vote for a party
    function vote(Party _chosenParty) public {
        // Check if the address has already voted
        require(!hasVoted[msg.sender], "You have already voted.");

        // Record the vote
        votes[_chosenParty] += 1;

        // Mark the address as having voted
        hasVoted[msg.sender] = true;

        // Emit the vote event
        emit Voted(msg.sender, _chosenParty);
    }

    // Get the vote count for a party
    function getVotes(Party _party) public view returns (uint256) {
        return votes[_party];
    }
}
