local cmds = {}
cmds.dex = function(tf, p, m, pv)
  local a = game
  for _,o in ipairs(p:split(.)) do
    a = a[o]
  end  
  for v in pairs(a:GetChildren()) do
    tf.print(v.name)
  end
  for _pv in pairs(a) do
    tf.print(tostring(_pv))
  end
end
return cmds
