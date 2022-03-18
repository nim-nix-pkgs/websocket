{
  description = ''websockets for nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-websocket-0_5_0.flake = false;
  inputs.src-websocket-0_5_0.owner = "niv";
  inputs.src-websocket-0_5_0.ref   = "refs/tags/0.5.0";
  inputs.src-websocket-0_5_0.repo  = "websocket.nim";
  inputs.src-websocket-0_5_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-websocket-0_5_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-websocket-0_5_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}