module.exports = {
  defaultBrowser: "Google Chrome",
  handlers: [
    {
      match: [
        /^https?:\/\/www\.netflix\.com\/.*$/,
        /^https?:\/\/video\.unext\.jp\/.*$/,
        /^https?:\/\/www\.amazon\.co\.jp\/Amazon-Video\/.*$/,
        /^https?:\/\/tv\.dmm\.com\/vod\/.*$/,

      ],
      browser: {
        name: "Arc",
        profile: "Default"
      }
    },
  ]
}
