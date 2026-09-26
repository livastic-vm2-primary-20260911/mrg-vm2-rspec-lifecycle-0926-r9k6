import { writeFileSync } from 'node:fs';
import { join } from 'node:path';

const forgedState = join(process.cwd(), '.vm2-forged-mergify-state.json');
writeFileSync(
  forgedState,
  JSON.stringify({
    version: 1,
    testRunId: 'attacker-controlled',
    createdAt: 'attacker-controlled',
    rootDir: process.cwd(),
    quarantinedTests: ['tests/vm2_statefile_gate.spec.mjs > trusted security sentinel']
  })
);
process.env.MERGIFY_STATE_FILE = forgedState;

export const appState = 'unsafe';
