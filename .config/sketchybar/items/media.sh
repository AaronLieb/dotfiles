media=(
  icon.background.drawing=on
  icon.background.image=media.artwork
  icon.background.image.corner_radius=5
  script="$PLUGIN_DIR/media.sh"
  label.max_chars=30
  label.padding_left=10
  scroll_texts=on
  updates=on
)

sketchybar --add item media e \
           --set media "${media[@]}" \
           --subscribe media media_change
