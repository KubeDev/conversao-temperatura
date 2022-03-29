# Projeto de subir uma aplicação 
[![Build Status](https://img.shields.io/github/workflow/status/hwdsl2/setup-ipsec-vpn/vpn%20test.svg?cacheSeconds=3600)](https://github.com/hwdsl2/setup-ipsec-vpn/actions) [![GitHub Stars](https://img.shields.io/github/stars/hwdsl2/setup-ipsec-vpn.svg?cacheSeconds=86400)](https://github.com/hwdsl2/setup-ipsec-vpn/stargazers) [![Docker Stars](https://img.shields.io/docker/stars/hwdsl2/ipsec-vpn-server.svg?cacheSeconds=86400)](https://github.com/hwdsl2/docker-ipsec-vpn-server) [![Docker Pulls](https://img.shields.io/docker/pulls/hwdsl2/ipsec-vpn-server.svg?cacheSeconds=86400)](https://github.com/hwdsl2/docker-ipsec-vpn-server)

Set up your own IPsec VPN server in just a few minutes, with IPsec/L2TP, Cisco IPsec and IKEv2 on Ubuntu, Debian and CentOS. All you need to do is provide your own VPN credentials, and let the scripts handle the rest.

An IPsec VPN encrypts your network traffic, so that nobody between you and the VPN server can eavesdrop on your data as it travels via the Internet. This is especially useful when using unsecured networks, e.g. at coffee shops, airports or hotel rooms.

We will use [Libreswan](https://libreswan.org/) as the IPsec server, and [xl2tpd](https://github.com/xelerance/xl2tpd) as the L2TP provider.

*Read this in other languages: [English](README.md), [简体中文](README-zh.md).*

#### Table of Contents

- [Quick start](#quick-start)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Next steps](#next-steps)
- [Important notes](#important-notes)
- [Upgrade Libreswan](#upgrade-libreswan)
- [Manage VPN users](#manage-vpn-users)
- [Advanced usage](#advanced-usage)