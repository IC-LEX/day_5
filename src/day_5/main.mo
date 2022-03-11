import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import HashMap "mo:base/HashMap";
import Error "mo:base/Error";
import Text "mo:base/Text";

actor {
  public shared({caller}) func isAnonymous() : async Bool{
    return(Principal.isAnonymous(caller));
  };

  let favouriteNumber : HashMap.HashMap<Principal, Nat> = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  public shared({caller}) func add_favourite_number(n : Nat) : async Text{
    switch(favouriteNumber.get(caller)){
      case(null){
        favouriteNumber.put(caller : Principal, n : Nat);
        return "You successfully registered your number!";};
      case(?num){
        return "You already registered your number!";
      };
    };
  };

  public shared({caller}) func show_favourite_number() : async ?Nat{
    return favouriteNumber.get(caller);
  };
// Challenge 5
  public shared({caller}) func update_favourite_number(n : Nat) : async (){
    favouriteNumber.put(caller : Principal, n : Nat);
  };
  public shared({caller}) func delete_favourite_number() : async (){
    favouriteNumber.delete(caller : Principal);
  };


// Challenge 6 - Deposit Cycles


// Challenge 7 - Withdraw Cycles


// Challenge 8 - Implement a stable variable Nat counting  canister upgrades


// Challenge 9 - Copy favourite number routines to new file and use stable type 
// Array to persist Entries across upgrades
private stable var favouriteNumberEntries : [(Principal, Nat)] = [];

system func preupgrade() {
favouriteNumberEntries : Iter.toArray()= [(Principal, Nat)] = [];
}

system func postupgrade() {
  
}

};

