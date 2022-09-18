function _node_install --on-event node_install
    if not command --query fnm
        fisher install nori-fish/fnm
    end
end

function _node_update --on-event node_install --on-event node_update
    set --function latest_version (fnm list-remote | tail -n1 | string replace --regex '^v' '')
    fnm install $latest_version
    fnm alias $latest_version latest
    fnm use latest
end

function _node_uninstall --on-event node_uninstall
    if command --query fnm
        fisher uninstall nori-fish/fnm
    end
end
