-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

return function()
	hl.env("XCURSOR_SIZE", "24")
	hl.env("HYPRCURSOR_SIZE", "24")
	hl.env("AQ_NO_ATOMOIC", "1")
	hl.env("AQ_NO_MODIFIERS", "1")
	hl.env("AQ_DEBUG", "no_buffer_age")
end

