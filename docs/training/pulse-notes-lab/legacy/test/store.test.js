import test from "node:test";
import assert from "node:assert/strict";
import { doThing, getAllStuff } from "../src/store.js";

test("doThing appends something", () => {
  const before = getAllStuff().length;
  doThing("ok-ish");
  assert.equal(getAllStuff().length, before + 1);
});
