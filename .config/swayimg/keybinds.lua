function deleteImage(mode)
  if os.execute("zenity --question --text 'Do you want to delete this file?'") == 0 then
    local image = mode.get_image()
    --os.remove(image.path)
    swayimg.text.set_status("File "..image.path.." removed")
  end
end

function scaleUp()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.scale
  -- swayimg.text.set_status("Scale "..scale)
  scale = scale + scale / 10
  swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end

function scaleDown()
  local pos = swayimg.get_mouse_pos()
  local scale = swayimg.viewer.scale
  -- swayimg.text.set_status("Scale "..scale)
  scale = scale - scale / 10
  swayimg.viewer.set_abs_scale(scale, pos.x, pos.y);
end


------------------------------------------------------
-- Gallery mode
------------------------------------------------------
swayimg.gallery.on_key("Return", function()
  swayimg.mode = "viewer"
end)
swayimg.gallery.on_mouse("MouseLeft", function()
  swayimg.mode = "viewer"
end)

swayimg.gallery.on_key("s", function()
  swayimg.mode = "slideshow"
end)

swayimg.gallery.on_key("Left", function() swayimg.gallery.select("left") end)
swayimg.gallery.on_key("Right", function() swayimg.gallery.select("right") end)
swayimg.gallery.on_key("Up", function() swayimg.gallery.select("up") end)
swayimg.gallery.on_key("Down", function() swayimg.gallery.select("down") end)
--
swayimg.gallery.on_key("h", function() swayimg.gallery.select("left") end)
swayimg.gallery.on_key("l", function() swayimg.gallery.select("right") end)
swayimg.gallery.on_key("k", function() swayimg.gallery.select("up") end)
swayimg.gallery.on_key("j", function() swayimg.gallery.select("down") end)

swayimg.gallery.on_key("g", function() swayimg.gallery.select("first") end)
swayimg.gallery.on_key("Shift+G", function() swayimg.gallery.select("last") end)

swayimg.gallery.on_key("Home", function() swayimg.gallery.select("first") end)
swayimg.gallery.on_key("End", function() swayimg.gallery.select("last") end)

swayimg.gallery.on_key("Prior", function() swayimg.gallery.select("first") end)
swayimg.gallery.on_key("Next", function() swayimg.gallery.select("last") end)

swayimg.gallery.on_key("Shift+plus", function()
  local size = swayimg.gallery.get_thumb_size()
  swayimg.gallery.set_thumb_size(size + 10)
end)

swayimg.gallery.on_key("minus", function()
  local size = swayimg.gallery.get_thumb_size()
  swayimg.gallery.set_thumb_size(size - 10)
end)

swayimg.gallery.on_key("equal", function()
  swayimg.gallery.set_thumb_size(300)
end)

-- print paths of all marked files
swayimg.gallery.on_key("Ctrl-p", function()
  local entries = swayimg.imagelist.get()
  for _, entry in ipairs(entries) do
    if entry.mark then
        print(entry.path)
    end
  end
end)


------------------------------------------------------
-- Viewer mode
------------------------------------------------------
swayimg.viewer.on_key("Return", function()
  swayimg.mode = "gallery"
end)

swayimg.viewer.on_key("Left", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("Right", function() swayimg.viewer.open("next") end)
swayimg.viewer.on_key("h", function() swayimg.viewer.open("prev") end)
swayimg.viewer.on_key("l", function() swayimg.viewer.open("next") end)

swayimg.viewer.on_key("Home", function() swayimg.viewer.open("first") end)
swayimg.viewer.on_key("End", function() swayimg.viewer.open("last") end)

function stepLeft()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x + wnd.width / 10), pos.y);
end

function stepRight()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(math.floor(pos.x - wnd.width / 10), pos.y);
end

function stepUp()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y + wnd.height / 10));
end

function stepDown()
  local wnd = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(pos.x, math.floor(pos.y - wnd.height / 10));
end

swayimg.viewer.on_mouse("MouseRight", function()
  swayimg.viewer.reset()
end)

swayimg.viewer.on_key("Shift+Left", stepLeft)
swayimg.viewer.on_key("Shift+Right", stepRight)
swayimg.viewer.on_key("Shift+Up", stepUp)
swayimg.viewer.on_key("Shift+Down", stepDown)

swayimg.viewer.on_mouse("Shift+ScrollLeft", stepLeft)
swayimg.viewer.on_mouse("Shift+ScrollRight", stepRight)
swayimg.viewer.on_mouse("Shift+ScrollUp", stepUp)
swayimg.viewer.on_mouse("Shift+ScrollDown", stepDown)

swayimg.viewer.on_mouse("ScrollUp", scaleUp)
swayimg.viewer.on_mouse("ScrollDown", scaleDown)
swayimg.viewer.on_key("Shift+plus", scaleUp)
swayimg.viewer.on_key("minus", scaleDown)
swayimg.viewer.on_key("k", scaleUp)
swayimg.viewer.on_key("j", scaleDown)

swayimg.viewer.on_key("equal", function()
  swayimg.viewer.set_fix_scale("optimal")
end)
swayimg.viewer.on_key("BackSpace", function()
  swayimg.viewer.set_fix_scale("optimal")
end)

swayimg.viewer.on_key("w", function()
  swayimg.viewer.set_fix_scale("fit")
end)

swayimg.viewer.on_key("Shift+w", function()
  swayimg.viewer.set_fix_scale("fill")
end)

swayimg.viewer.on_key("0", function()
  swayimg.viewer.set_fix_scale("real")
end)

swayimg.viewer.on_key("f", function()
  swayimg.viewer.flip_horizontal()
end)

swayimg.viewer.on_key("Shift+f", function()
  local image = swayimg.viewer.get_image()
  swayimg.viewer.flip_vertical()
end)

swayimg.viewer.on_key("BracketLeft", function()
  swayimg.viewer.rotate(270)
end)

swayimg.viewer.on_key("BracketRight", function()
  swayimg.viewer.rotate(90)
end)

swayimg.viewer.on_key("r", function()
  swayimg.viewer.reload()
end)

swayimg.viewer.on_key("o", function() swayimg.viewer.next_frame() end)
swayimg.viewer.on_key("Shift+o", function() swayimg.viewer.prev_frame() end)
swayimg.viewer.on_key("n", function() swayimg.viewer.animation_resume() end)


------------------------------------------------------
-- Slideshow mode
------------------------------------------------------
swayimg.slideshow.on_key("Return", function()
  swayimg.mode = "gallery"
end)

swayimg.slideshow.on_key("Left", function() swayimg.slideshow.open("prev") end)
swayimg.slideshow.on_key("Right", function() swayimg.slideshow.open("next") end)
swayimg.slideshow.on_key("h", function() swayimg.slideshow.open("prev") end)
swayimg.slideshow.on_key("l", function() swayimg.slideshow.open("next") end)

swayimg.slideshow.on_key("Home", function() swayimg.slideshow.open("first") end)
swayimg.slideshow.on_key("End", function() swayimg.slideshow.open("last") end)

------------------------------------------------------
-- Common
------------------------------------------------------
modes = { swayimg.gallery, swayimg.viewer, swayimg.slideshow }
for _i, mode in ipairs(modes) do
  mode.on_key("Escape", function()
    if mode == swayimg.gallery then
      swayimg.exit()
    else
      swayimg.mode = "gallery"
    end
  end)

  mode.on_key("q", function()
    swayimg.exit()
  end)

  mode.on_key("Space", function()
    mode.mark_image()
  end)

  mode.on_key("Shift+B", function()
    local image = mode.get_image()
    os.execute("set-wallpaper '"..image.path.."'");
  end)

  mode.on_key("Shift+Delete", function() deleteImage(mode) end)
end
