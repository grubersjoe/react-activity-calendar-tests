# React Activity Calendar Tests

This repository is to test the usage of `react-activity-calendar` in the
following React frameworks in their development and production mode. In
particular, this involves checking that server side rendering (SSR) works. All
projects were created according to their documentation.

- Astro v6
- Next.js v16
- Remix v2
- Vite v8

## Usage

To execute the test scripts `bash` and [`pnpm`](https://pnpm.io/) are required.

There are two scripts: one that uses the currently published
`react-activity-calendar` npm package and another that builds the current main
branch of it and copies the result into the `node_modules/` directories of each
project. The `<ActivityCalendar />` component is rendered in all frameworks
using the same props. Each project is built and launched. Then, the
corresponding demo page is opened in the browser automatically.

```shell
# To test using the currently published npm package
./test-npm.sh dev
./test-npm.sh ssr

# To test using the locally checked out react-activity-calendar source
./test-local.sh dev
./test-local.sh ssr
```
