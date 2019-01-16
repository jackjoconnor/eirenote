import Typed from "typed.js";

const loadDynamicBannerText = () => {
  new Typed("#banner-typed-text", {
    strings: ["Discover Ireland.", "Never lose a memory.", "Make a note of it."],
    typeSpeed: 100,
    loop: true
  });
};

export {
  loadDynamicBannerText
};