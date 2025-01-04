if true then
  return {}
end

return {
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        -- disable animation
        animation = function()
          return 0
        end,
      },
    },
  },
}
