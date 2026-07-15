/**
 * Legacy pulse dump — intentionally messy.
 * Used by Station B (/prd-reverse). DO NOT clean up before the lab.
 *
 * Observed behavior (maybe): append-only lines in a text blob.
 * Naming is confusing on purpose.
 */

let mem = [];

export function doThing(x) {
  // "x" might be a string mood? or a full note? nobody knows
  if (!x) return mem;
  mem.push({ t: Date.now(), v: String(x), tag: x.tag || "idk" });
  return mem;
}

export function getAllStuff() {
  return mem.slice().reverse();
}

export function filterIdk(tag) {
  // buggy-ish: compares loosely, ignores empties somehow
  return mem.filter((i) => (i.tag || "").includes(tag || ""));
}

// dead code / trap
export function weeklyReportMaybe() {
  return "TODO ask product";
}
