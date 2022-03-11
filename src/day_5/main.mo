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
};

