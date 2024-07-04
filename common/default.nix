{ pkgs
, name
}:

let

  bashrcLocal = let
    sgr0 = "\\[\\$(tput sgr0)\\]";
    hi-blue = "\\[\\e[1;34m\\]";
    hi-white = "\\[\\e[38;5;15m\\]";
    hi-yellow = "\\[\\e[38;5;228m\\]";
  in pkgs.runCommandLocal "bashrc-local" { } ''
          mkdir -p $out/etc
          cat >$out/etc/bashrc.local <<EOF
export EMACS_ENV="${name}"
export PS1="(${sgr0}${hi-white}${name}${sgr0}) [${sgr0}${hi-yellow}\w${sgr0}] ${sgr0}${hi-blue}\\$ ${sgr0}"
unset TZ
EOF
        '';

in {
  inherit bashrcLocal;
}
