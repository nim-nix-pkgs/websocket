{
  description = ''websockets for nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-websocket-0_3_5.flake = false;
  inputs.src-websocket-0_3_5.owner = "niv";
  inputs.src-websocket-0_3_5.ref   = "refs/tags/0.3.5";
  inputs.src-websocket-0_3_5.repo  = "websocket.nim";
  inputs.src-websocket-0_3_5.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-websocket-0_3_5"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-websocket-0_3_5";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}