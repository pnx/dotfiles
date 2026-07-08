import type { Plugin } from "@opencode-ai/plugin"

// CONFIGURATION: Set to true to enable this plugin
const ENABLED = true

export const Notify: Plugin = async ({ $ }) => {
  // Plugin disabled - set ENABLED = true to activate
  if (!ENABLED) return {}
  
  return {
    async event(input) {
      if (input.event.type === "session.idle") {
        await $`notify-send t 10000 "Opencode" "Your code is done!"`
      }
    },
  }
}
