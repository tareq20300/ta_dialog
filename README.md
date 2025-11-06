---
title: exports
---

## Data type
```lua
--- @class Button
--- @field label string
--- @field id string|number? (optional)
--- @field onSelect function? (optional)
--- @field close boolean? (optional)
--- @field nextDialog string? (optional)

--- @class dialog
--- @field job string
--- @field id string
--- @field ped number?
--- @field name string
--- @field text string
--- @field buttons Button[]
```
## showDialog
```lua
exports.bl_dialog:showDialog(data)
```

#### data: `table`
- **ped**: `number` (`handle`)  
  The handle representing the ped (pedestrian character).

- **dialog**: `table`
  - **id**: `string | number`  
    A unique identifier for the dialog, used to control which dialog is active.

  - **job**: `string`  
    The label for the ped's job or role.

  - **name**: `string`  
    The name of the ped.

  - **text**: `string`  
    The content of the dialog text.

  - **textSpeed**: `number?`  
    The text writing speed, measured in milliseconds per character. Default: 25ms.

  - **buttons**: `array` of `table`  
    A list of buttons associated with the dialog. Each button can have the following properties:
    
    - **label**: `string`  
      The text displayed on the button.
    
    - **id?**: `string | number` (optional)  
      An optional unique identifier for the button.
    
    - **nextDialog?**: `string` (optional)  
      If specified, opens the dialog with the given ID.
    
    - **close?**: `boolean` (optional)  
      Indicates whether the dialog should be closed when this button is pressed.
    
    - **onSelect?**: `function(switchDialog: function)` (optional)  
      A callback function triggered when the button is selected. The function receives the dialog data as a parameter.

      Example:
      ```lua
      function(switchDialog)
          switchDialog(dialogId)
      end
      ```

- **return**: `string | number`
  The ID of the last button that closed the dialog.

## switchDialog
```lua
exports.bl_dialog:switchDialog(dialogId)
```
#### dialogId: `number|string`

# Example
```lua
local lastButtonId = exports.bl_dialog:showDialog({
    ped = ped,
    dialog = {
        {
            id = 'initial_fish_talk',
            job = 'Fisher Man',
            name = 'Robert',
            text = 'first dialog',
            buttons = {
                {
                    id = 'leave1',
                    label = 'Switch',
                    nextDialog = 'fish_catalog', -- switch to second dialog
                    onSelect = function(switchDialog)
                        if not canSwitchToLastDialog then

                        -- do something here

                        switchDialog('fish_talk_end') -- switch to third dialog
                    end
                },
            },
        },
        {
            id = 'fish_catalog',
            job = 'Fisher Man',
            name = 'Robert',
            text = 'second dialog',
            buttons = {
                {
                    id = 'leave2',
                    label = 'Switch',
                    nextDialog = 'initial_fish_talk',
                },
            },
        },
        {
            id = 'fish_talk_end',
            job = 'Fisher Man',
            name = 'Robert',
            text = 'third dialog',
            buttons = {
                {
                    id = 'end',
                    label = 'End conversation', --end conversation
                    close = true,
                },
            },
        },
    }
})

-- lastButtonId should be == `end`

exports.bl_dialog:switchDialog(dialogId)
```
