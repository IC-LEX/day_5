import Principal "mo:base/Principal";
import Nat "mo:base/Nat";


actor {
  public shared({caller}) func isAnonymous() : async Bool{
    return(Principal.isAnonymous(caller));
  };

  private let favouriteNumber : HashMap.HashMap<Principal, Nat> = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  public shared({caller}) func add_favourite_number(n : Nat) : (){
    return favouriteNumber.put(caller : Principal, n : Nat);
  };

  public shared({caller}) func show_favourite_number() : (){
    return favouriteNumber.get(caller : Principal);
  };
};
