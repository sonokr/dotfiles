module.exports = {
  defaultBrowser: "Google Chrome",
  handlers: [
    {
      match: [
        /^https?:\/\/calendar\.google\.com\/.*$/,
        /^https?:\/\/meet\.google\.com\/.*$/,
      ],
      browser: {
        name: "Google Chrome",
        profile: "Profile 1" // ユーザーB
      }
    },
    {
      match: [
        /^https?:\/\/github\.com\/.*$/,
      ],
      browser: {
        name: "Google Chrome",
        profile: "Default" // ユーザーA
      }
    },
  ]
}