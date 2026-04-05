------------------------------------------------------
-- Stay sane, please.
------------------------------------------------------
swayimg.gallery.bind_reset()
swayimg.viewer.bind_reset()
swayimg.slideshow.bind_reset()

swayimg.viewer.set_text("topleft", {})
swayimg.viewer.set_text("topright", {})
swayimg.viewer.set_text("bottomleft", {})
swayimg.viewer.set_text("bottomright", {})

------------------------------------------------------
-- General config
------------------------------------------------------
swayimg.set_mode("viewer")                -- mode at startup
swayimg.enable_antialiasing(true)         -- anti-aliasing
swayimg.enable_decoration(false)          -- window title/buttons/borders
swayimg.enable_overlay(true)              -- window overlay mode
swayimg.enable_exif_orientation(true)     -- image orientation by EXIF
swayimg.set_dnd_button("MouseMiddle")     -- drag-and-drop mouse button

------------------------------------------------------
-- Image list configuration
------------------------------------------------------
swayimg.imagelist.set_order("alpha")      -- list order
swayimg.imagelist.enable_reverse(false)   -- reverse order
swayimg.imagelist.enable_recursive(false) -- recursive directory reading
swayimg.imagelist.enable_adjacent(false)  -- add adjacent files from same dir
swayimg.imagelist.enable_fsmon(true)      -- enable file system monitoring

------------------------------------------------------
-- Text overlay configuration
------------------------------------------------------
swayimg.text.set_font("monospace")        -- font name
swayimg.text.set_size(12)                 -- font size in pixels
swayimg.text.set_spacing(0)               -- line spacing
swayimg.text.set_padding(10)              -- padding from window edge
swayimg.text.set_foreground(0xffcccccc)   -- foreground text color
swayimg.text.set_background(0x00000000)   -- text background color
swayimg.text.set_shadow(0x0d000000)       -- text shadow color
swayimg.text.set_timeout(5)               -- layer hide timeout
swayimg.text.set_status_timeout(3)        -- status message hide timeout

------------------------------------------------------
-- Image viewer mode
------------------------------------------------------
swayimg.viewer.set_default_scale("optimal")      -- default image scale
swayimg.viewer.set_default_position("center")    -- default image position
swayimg.viewer.set_drag_button("MouseLeft")      -- mouse button to drag image
swayimg.viewer.set_window_background(0xff000000) -- window background color
swayimg.viewer.set_image_chessboard(1000, 0xff000000, 0xff000000) -- chessboard
swayimg.viewer.enable_centering(true)            -- enable automatic centering
swayimg.viewer.enable_loop(false)                -- enable image list loop mode
swayimg.viewer.limit_preload(5)                  -- number of images to preload
swayimg.viewer.limit_history(5)                  -- number of the history cache
swayimg.viewer.set_mark_color(0xff808080)        -- mark icon color
swayimg.viewer.set_text("topleft", {
  "File: {name}",
  "Format: {format}",
  "File size: {sizehr}",
  "File time: {time}",
  "EXIF date: {meta.Exif.Photo.DateTimeOriginal}",
  "EXIF camera: {meta.Exif.Image.Model}"
})
swayimg.viewer.set_text("topright", {
  "Image: {list.index} of {list.total}",
  "Frame: {frame.index} of {frame.total}",
  "Size: {frame.width}x{frame.height}"
})
swayimg.viewer.set_text("bottomleft", {
  "Scale: {scale}"
})

------------------------------------------------------
-- Slide show mode, same config as for viewer mode with the following defaults:
------------------------------------------------------
swayimg.slideshow.set_timeout(5)                    -- timeout to switch image
swayimg.slideshow.set_default_scale("fit")          -- default image scale
swayimg.slideshow.set_window_background("auto")     -- window background mode
swayimg.slideshow.limit_history(0)                  -- number of the history cache
swayimg.slideshow.set_text("topleft", { "{name}" }) -- top left text block scheme

------------------------------------------------------
-- Gallery mode
------------------------------------------------------
swayimg.gallery.set_aspect("keep")                  -- thumbnail aspect ratio
swayimg.gallery.set_thumb_size(300)                 -- thumbnail size in pixels
swayimg.gallery.set_padding_size(25)                -- padding between thumbnails
swayimg.gallery.set_border_size(3)                  -- border size for selected thumbnail
swayimg.gallery.set_border_color(0xffacacac)        -- border color for selected thumbnail
swayimg.gallery.set_selected_scale(1.2)             -- scale for selected thumbnail
swayimg.gallery.set_selected_color(0xff808080)      -- background color for selected thumbnail
swayimg.gallery.set_unselected_color(0xff808080)    -- background color for unselected thumbnail
swayimg.gallery.set_window_color(0xff000000)        -- window background color
swayimg.gallery.limit_cache(100)                    -- number of thumbnails stored in memory
swayimg.gallery.enable_preload(false)               -- preloading invisible thumbnails
swayimg.gallery.enable_pstore(true)                 -- enable persistent storage for thumbnails
swayimg.gallery.set_text("bottomright", { "File: {name}" })
swayimg.gallery.set_text("topright", { "{list.index} of {list.total}" })

------------------------------------------------------
-- Miscellaneous
------------------------------------------------------
-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
  if swayimg.get_mode() == "viewer" then
    swayimg.viewer.set_fix_scale("optimal")
  end
end)

------------------------------------------------------
-- Keybinds
------------------------------------------------------
function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)") or "./"
end
dofile(script_path() .. "/keybinds.lua")
