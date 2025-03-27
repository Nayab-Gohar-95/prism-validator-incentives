// PRISM Model for Ethereum Validator Rewards

mdp

// Constants
const int MAX_BALANCE = 32; // Max effective balance in ETH
const int BASE_REWARD_FACTOR = 64;
const double TOTAL_ACTIVE_BALANCE = 1024.0; // Example total active balance
const double SQRT_TOTAL_ACTIVE_BALANCE = 32.0; // Precomputed sqrt(1024)

// Variables
global effective_balance : [0..MAX_BALANCE] init MAX_BALANCE; // Validator's balance
global state : [0..2] init 0; // Validator states: 0=Idle, 1=Attesting, 2=Proposing

// Functions
formula base_reward = (effective_balance * BASE_REWARD_FACTOR) / SQRT_TOTAL_ACTIVE_BALANCE;

// Transitions
module Validator
    // Idle: Transition to Attesting or Proposing
    [] state=0 -> 0.8 : (state'=1) + 0.2 : (state'=2); 
    
    // Attesting: Transition back to Idle and gain rewards
    [] state=1 -> (state'=0) & (effective_balance'=min(MAX_BALANCE, effective_balance + floor(base_reward))); 
    
    // Proposing: Transition back to Idle and gain rewards
    [] state=2 -> (state'=0) & (effective_balance'=min(MAX_BALANCE, effective_balance + floor(base_reward))); 
endmodule

// Labels
label "valid_balance" = effective_balance >= 0 & effective_balance <= MAX_BALANCE;
label "valid_states" = (state=0 | state=1 | state=2);

