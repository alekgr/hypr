---------------
---- INPUT ----
---------------

hl.config({
    input = {
	focus_on_close = 0,
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape",
        kb_rules   = "",

        follow_mouse = 0,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },

    cursor = {
	    no_warps = true,
    },
})
