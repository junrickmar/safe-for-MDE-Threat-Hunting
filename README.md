# 🚨 Cracked Adobe Photoshop Threat Simulation (Safe for MDE Threat Hunting)

> ⚠️ **For educational and internal threat hunting use only.**
> This repository contains **safe PowerShell scripts** that simulate a cracked software scenario commonly associated with malware, such as info-stealers and persistence via registry keys.

## 🧪 Purpose

This simulation helps blue teams, threat hunters, and SOC analysts practice detecting suspicious behavior from pirated software using Microsoft Defender for Endpoint (MDE) or similar EDR/XDR tools.

---

## 🧷 Scenario Summary

- A user downloads `photoshop-2024-crack.zip` from a "torrent site"
- The user extracts and runs `setup.ps1` to install a fake Adobe Photoshop
- The user then runs `patcher.ps1`, which:
  - Drops a fake payload (`svhost.exe`) in `%AppData%\RoamingApp`
  - Adds a Windows Registry Run key to simulate persistence
- The "malware" (`svhost.ps1`) simulates running in the background

---

## 📁 ZIP File Structure

