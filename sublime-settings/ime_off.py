import sublime, sublime_plugin
import ctypes
import platform
import os

class DisabledImeCommand(sublime_plugin.EventListener):
    def on_text_command(self, view, command_name, args):
        name = command_name.lower()

        if (name == '_enter_normal_mode'):
            if platform.system()=="Windows":
                # Ctrl+[ などで Esc のキーマップをしている場合、
                # Ctrl(キーコード17)を強制的にキー解除していないと、
                # 無変換キーが有効にならない
                ctypes.windll.user32.keybd_event(17, 0, 0x2, 0)
                # キーコード29は「無変換」キー
                # IMEの設定で無変換キーをIME Offに設定しておく必要がある
                ctypes.windll.user32.keybd_event(29, 0, 0, 0)
            else:
                # OSXならキーコード102(英数)キーを押す
                # US配列の場合は検証してません
                cmd = """
                osascript -e 'tell application "System Events" to key code {102}'
                """
                os.system(cmd)