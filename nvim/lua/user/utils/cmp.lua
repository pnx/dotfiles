local hasluansp, luasnip = pcall(require, "luasnip")
local cmp = require("cmp")

local M = {}

function M.selectNext(opts)
	return cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item(opts or {})
		elseif hasluansp and luasnip.locally_jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, { "i", "s" })
end

function M.selectPrev(opts)
	return cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item(opts or {})
		elseif hasluansp and luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, { "i", "s" })
end

function M.confirm(opts)
	return cmp.mapping(function(fallback)
		if cmp.visible() then
			-- if luasnip.expand_or_jumpable() then
			-- 	luasnip.expand_or_jump()
			-- else
				cmp.confirm(opts or {})
			-- end
		else
			fallback()
		end
	end)
end

return M
