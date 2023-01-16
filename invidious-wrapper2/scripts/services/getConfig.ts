

import { compat, types as T } from "../deps.ts";

export const getConfig: T.ExpectedExports.getConfig = compat.getConfig({
  "tor-address": {
    "name": "Tor Address",
    "description": "The Tor address of the network interface",
    "type": "pointer",
    "subtype": "package",
    "package-id": "invidious",
    "target": "tor-address",
    "interface": "main",
  },
  "lan-address": {
    "name": "LAN Address",
    "description": "The LAN address of the network interface",
    "type": "pointer",
    "subtype": "package",
    "package-id": "invidious",
    "target": "lan-address",
    "interface": "main",
  }
});
