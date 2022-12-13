if type pbcopy >/dev/null 2>&1
    # Mac  
    alias CLIPBOARD_COMMAND pbcopy
else if type xsel >/dev/null 2>&1
    # Linux
    alias CLIPBOARD_COMMAND 'xsel --input --clipboard'
end
