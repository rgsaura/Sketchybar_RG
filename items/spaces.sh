#!/bin/bash


SPACE_ICONS=("" "" "" "" "" "" "" "" "" "")

# SPACE_ICONS=("" "󰓩" "" "󰙴" "󱞂" "" "" "" "" "" )

# # Insert the icon for "Cursor" at its position
# CURSOR_SPACE=$(yabai -m query --windows | jq -r '.[] | select(.app == "Cursor").space')
# if [ "$CURSOR_SPACE" -gt 0 ]; then
#   SPACE_ICONS=("${SPACE_ICONS[@]:0:$CURSOR_SPACE-1}" "" "${SPACE_ICONS[@]:$CURSOR_SPACE}")
# fi


sid=0
spaces=()
for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  icon="${SPACE_ICONS[i]}"

  # Check if the space is empty or not
  is_empty=$(yabai -m query --spaces | jq -r ".[] | select(.index == $sid) | .windows == []")


  space=(
    associated_space=$sid
    icon=$icon
    icon.padding_left=10
    icon.padding_right=10
    padding_left=2
    padding_right=2
    label.padding_right=20
    icon.highlight_color=$CYAN
    label.color=$GREY
    label.highlight_color=$WHITE
    label.font="sketchybar-app-font:Regular:16.0"
    label.y_offset=-1
    background.color=$BACKGROUND_1
    background.border_color=$BACKGROUND_2
    background.drawing=off
    label.drawing=off
    click_script="yabai -m space --focus $sid"
    # script="$PLUGIN_DIR/space.sh"  
  )

  if [ "$is_empty" == "true" ]; then
    space+=("icon.color=$WHITE")
    space+=("icon=")  # Replace ONE_COLOR with the color you want for empty spaces
  else
    space+=("icon.color=$ORANGE")
  fi

  sketchybar --add space space.$sid left    \
             --set space.$sid "${space[@]}" \
             --subscribe space.$sid mouse.clicked 
done

spaces_bracket=(
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
)

separator=(
  icon=
  icon.font="$FONT:Bold:16.0"
  padding_left=15
  padding_right=-5
  label.drawing=off
  associated_display=active
  # click_script='yabai -m space --create && sketchybar --trigger space_change'
  icon.color=$WHITE
)

sketchybar --add bracket spaces_bracket '/space\..*/'  \
          #  --set spaces_bracket "${spaces_bracket[@]}" \

sketchybar --add item separator left                   \
           --set separator "${separator[@]}"

