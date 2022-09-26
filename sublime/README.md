# Sublime Text 搭建 golang 开发环境

## 安装LSP插件

Package Control: Install Package

安装:
- LSP
- LSP-gopls

## LSP 设置

Sublime Text -> Preferences -> Package Settings -> Package Control -> LSP -> Settings

```json
{
	"lsp_format_on_save": true,
	"clients": 
	{
		"gopls": 
		{
			"enabled": true, 
			"initializationOptions": {
				"gofumpt": true
			}
		}
	}
}
```

## LSP 快捷键设置

Sublime Text -> Preferences -> Package Settings -> Package Control -> LSP -> Key Bindings
```
[
	// 格式化代码（全部）
	{
		"command": "lsp_format_document",
		"keys": [
			"primary+alt+l"
		],
		"context": [
			{
				"key": "lsp.session_with_capability",
				"operator": "equal",
				"operand": "documentFormattingProvider | documentRangeFormattingProvider"
			}
		]
	},
	// 跳转到定义（包括变量定义，结构定义，方法声明）
	{
		"command": "lsp_symbol_definition",
		"args": {
        	"side_by_side": false
        },
		"context": [
			{
				"key": "lsp.session_with_capability",
				"operator": "equal",
				"operand": "definitionProvider | typeDefinitionProvider | declarationProvider"
			},
			{
				"key": "auto_complete_visible",
				"operator": "equal",
				"operand": false
			}
		]
	},
	// 跳转到接口的实现（同样绑定到鼠标快捷键）
	{
		"command": "lsp_symbol_implementation",
		"args": {
        	"side_by_side": false
        },
		"context": [
			{
				"key": "lsp.session_with_capability",
				"operator": "equal",
				"operand": "implementationProvider"
			},
			{
				"key": "auto_complete_visible",
				"operator": "equal",
				"operand": false
			}
		]
	},
	// 重命名
	{
		"command": "lsp_symbol_rename",
		"keys": [
			"shift+f6"
		],
		"context": [
			{
				"key": "lsp.session_with_capability",
				"operator": "equal",
				"operand": "implementationProvider"
			},
			{
				"key": "auto_complete_visible",
				"operator": "equal",
				"operand": "renameProvider"
			}
		]
	}
]
```

### 定义鼠标快捷键

新建鼠标映射文件：
/Users/yourname/Library/Application Support/Sublime Text/Packages/User/Default (OSX).sublime-mousemap

```
[
	// ctrl+鼠标左键，跳转到定义（lsp_symbol_definition)
	{
		"button": "button1",
		"count": 1,
		"modifiers": [
			"ctrl"
		],
		"press_command": "drag_select",
		"command": "lsp_symbol_definition"
	},
	// ctrl+鼠标右键，查看方法被使用的地方(lsp_symbol_references)
	{
		"button": "button2",
		"count": 1,
		"modifiers": [
			"ctrl"
		],
		"press_command": "drag_select",
		"command": "lsp_symbol_references"
	},
	// ctrl+alt+鼠标左键，接口的实现
	{
		"button": "button1",
		"count": 1,
		"modifiers": [
			"ctrl","alt"
		],
		"press_command": "drag_select",
		"command": "lsp_symbol_implementation"
	}
]
```
