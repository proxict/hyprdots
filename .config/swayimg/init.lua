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
swayimg.mode = "viewer"             -- mode at startup
swayimg.antialiasing = true         -- anti-aliasing
swayimg.decoration = false          -- window title/buttons/borders
swayimg.overlay = true              -- window overlay mode
swayimg.exif_orientation = true     -- image orientation by EXIF
swayimg.dnd_button = "MouseMiddle"  -- drag-and-drop mouse button

------------------------------------------------------
-- Image list configuration
------------------------------------------------------
swayimg.imagelist.order = "alpha"      -- list order
swayimg.imagelist.reverse = false   -- reverse order
swayimg.imagelist.recursive = false -- recursive directory reading
swayimg.imagelist.adjacent = false  -- add adjacent files from same dir
swayimg.imagelist.fsmon = true      -- enable file system monitoring

------------------------------------------------------
-- Text overlay configuration
------------------------------------------------------
swayimg.text.font = "monospace"        -- font name
swayimg.text.size = 12                 -- font size in pixels
swayimg.text.spacing = 0               -- line spacing
swayimg.text.padding = 10              -- padding from window edge
swayimg.text.color = 0xffcccccc   -- foreground text color
swayimg.text.background = 0x00000000   -- text background color
swayimg.text.shadow = 0x0d000000       -- text shadow color
swayimg.text.timeout = 5               -- layer hide timeout
swayimg.text.status_timeout = 3        -- status message hide timeout

------------------------------------------------------
-- Image viewer mode
------------------------------------------------------
swayimg.viewer.default_scale = "optimal"      -- default image scale
swayimg.viewer.default_position = "center"    -- default image position
swayimg.viewer.drag_button = "MouseLeft"      -- mouse button to drag image
swayimg.viewer.set_window_background(0xff000000) -- window background color
swayimg.viewer.set_image_chessboard(1000, 0xff000000, 0xff000000) -- chessboard
swayimg.viewer.autocenter = true            -- enable automatic centering
swayimg.viewer.loop = false                -- enable image list loop mode
swayimg.viewer.preload = 5                  -- number of images to preload
swayimg.viewer.history = 5                  -- number of the history cache
swayimg.viewer.mark_color = 0xff808080        -- mark icon color
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
swayimg.slideshow.timeout = 5                    -- timeout to switch image
swayimg.slideshow.default_scale = "fit"          -- default image scale
swayimg.slideshow.set_window_background("auto")     -- window background mode
swayimg.slideshow.history = 0                  -- number of the history cache
swayimg.slideshow.set_text("topleft", { "{name}" }) -- top left text block scheme

------------------------------------------------------
-- Gallery mode
------------------------------------------------------
swayimg.gallery.aspect = "keep"                  -- thumbnail aspect ratio
swayimg.gallery.thumb_size = 300                 -- thumbnail size in pixels
swayimg.gallery.padding_size = 25                -- padding between thumbnails
swayimg.gallery.border_size = 3                  -- border size for selected thumbnail
swayimg.gallery.border_color = 0xffacacac        -- border color for selected thumbnail
swayimg.gallery.selected_scale = 1.2             -- scale for selected thumbnail
swayimg.gallery.selected_color = 0xff808080      -- background color for selected thumbnail
swayimg.gallery.unselected_color = 0xff808080    -- background color for unselected thumbnail
swayimg.gallery.window_color = 0xff000000        -- window background color
swayimg.gallery.cache = 100                    -- number of thumbnails stored in memory
swayimg.gallery.preload = false               -- preloading invisible thumbnails
swayimg.gallery.pstore = true                 -- enable persistent storage for thumbnails
swayimg.gallery.set_text("bottomright", { "File: {name}" })
swayimg.gallery.set_text("topright", { "{list.index} of {list.total}" })

------------------------------------------------------
-- Miscellaneous
------------------------------------------------------
-- force set scale mode on window resize (useful for tiling compositors)
swayimg.on_window_resize(function()
  if swayimg.mode == "viewer" then
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
