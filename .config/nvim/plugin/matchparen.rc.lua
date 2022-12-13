local ok, matchparen = pcall(require, "matchparen")
if not (ok) then return end

matchparen.setup()
