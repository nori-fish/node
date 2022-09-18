function _node_install --on-event node_install
    fisher install nori-fish/fnm
    fnm install (fnm list-remote | tail -n1 | string replace --regex '^v' '')
end

function _node_update --on-event node_update
    fisher update nori-fish/fnm
    fnm install (fnm list-remote | tail -n1 | string replace --regex '^v' '')
end

function _node_uninstall --on-event node_uninstall
    if command --query fnm
        fisher uninstall nori-fish/fnm
    end
end
