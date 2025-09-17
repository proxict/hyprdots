// ==UserScript==
// @name         RemoveYtElements
// @version      1.1.0
// @description  Remove annoying elements from YouTube
// @author       idk, me?
// @match        *://*.youtube.com/*
// @exclude      *://*.youtube.com/subscribe_embed?*
// ==/UserScript==

//(function () {
//  "use strict";
//
//  // Function to remove elements within #items if they contain specified text
//  function removeElementsWithText(texts) {
//    var elementsToRemove = document.querySelectorAll(
//      "#items > ytd-guide-entry-renderer",
//    );
//
//    Array.from(elementsToRemove).forEach(function (element) {
//      texts.forEach(function (text) {
//        if (element.innerText.includes(text)) {
//          element.remove();
//        }
//      });
//    });
//  }
//
//  function removeShortsFromSubscriptions() {
//    //var homeAd = document.querySelector("#contents > ytd-rich-item-renderer:nth-child(1)");
//    //if (homeAd) {
//    //    homeAd.style.hide = 'none';
//    //    homeAd.remove();
//    //}
//
//    var homeShorts = document.querySelector("#contents > ytd-rich-section-renderer");
//    if (homeShorts) {
//        homeShorts.style.hide = 'none';
//        homeShorts.remove();
//    }
//
//    var homeShorts2 = document.querySelector("#contents > ytd-rich-section-renderer:nth-child(3)");
//    if (homeShorts2) {
//        homeShorts2.style.hide = 'none';
//        homeShorts2.remove();
//    }
//
//    var subShorts = document.querySelector("#contents > ytd-item-section-renderer:nth-child(2)");
//    if (subShorts) {
//        subShorts.style.hide = 'none';
//        subShorts.remove();
//    }
//  }
//
//
//  let blist = ["Home", "Shorts"];
//
//  // Function to be called when mutations are observed
//  function handleMutations(mutationsList, observer) {
//    removeElementsWithText(blist); // Adjust the texts as needed
//    removeShortsFromSubscriptions();
//  }
//
//  // Options for the observer (which mutations to observe)
//  const observerConfig = { childList: true, subtree: true };
//
//  // Create an observer instance linked to the callback function
//  const observer = new MutationObserver(handleMutations);
//
//  // Start observing the target node for configured mutations
//  observer.observe(document.body, observerConfig);
//
//  // Perform initial removal on page load
//  removeElementsWithText(blist); // Adjust the texts as needed
//  removeShortsFromSubscriptions();
//})();
