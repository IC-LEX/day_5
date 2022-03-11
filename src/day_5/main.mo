import Principal "mo:base/Principal";
import Nat "mo:base/Nat";


actor {
  public shared({caller}) func isAnonymous() : async Bool{
    return(Principal.isAnonymous(caller));
  };
};
