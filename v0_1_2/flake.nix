{
  description = ''Circular buffer implementation'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-RingBuffer-v0_1_2.flake = false;
  inputs.src-RingBuffer-v0_1_2.owner = "megawac";
  inputs.src-RingBuffer-v0_1_2.ref   = "refs/tags/v0.1.2";
  inputs.src-RingBuffer-v0_1_2.repo  = "RingBuffer.nim";
  inputs.src-RingBuffer-v0_1_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-RingBuffer-v0_1_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-RingBuffer-v0_1_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}