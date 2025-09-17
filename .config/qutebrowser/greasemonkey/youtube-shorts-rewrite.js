// ==UserScript==
// @name         shorts-killer
// @version      1.0.0
// @description  Redirect YouTube shorts to full format videos
// @author       ProXicT.
// @match https://*.youtube.com/shorts/*
// ==/UserScript==

document.location = String(document.location).replace('shorts/', 'watch?v=');
