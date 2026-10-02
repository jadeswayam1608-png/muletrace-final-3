# MULETRACE // COMPREHENSIVE SPECIFICATION & BUILD DIRECTIVE
## Autonomous Money-Mule & Layering Ring Detection System

### 1. Product Definition
- **Product Name**: MuleTrace
- **Core Purpose**: Autonomous Money-Mule & Layering Ring Detection System. Reads transaction and KYC data, reconstructs account networks, flags suspicious mule structures (fan-in/fan-out, pass-through layering, cycles, sybil device/IP clusters), traces tainted stolen funds chronologically, simulates early account freeze interventions, and generates compliance-grade investigation dossiers.
- **Hackathon One-Line Pitch**: *"MuleTrace shows a fraud analyst where suspicious money went, how fast it moved, why each account was flagged, and how much could have been saved if the right accounts had been frozen earlier."*
- **Honest Project Claim**: *"Detects planted suspicious structures in synthetic transaction data, designed as an explainable, deterministic prototype for real transaction-data workflows."*
- **Target Users**: Fraud Analysts, AML/Compliance Officers, Hackathon Evaluators, FinTech Engineers.

---

### 2. Core Rules & Tenets
1. **Synthetic Data Only**: Strictly synthetic transactions and fictional entities. Never use or request real customer PII.
2. **No Hidden Magic**: Detection thresholds are transparent and configurable via `backend/config/thresholds.yaml`.
3. **Explainability First**: Every alert provides a risk score, confidence rating, evidence breakdown, non-technical plain reason, technical reason, and counterfactual ("What would clear this account?").
4. **Never Invent Results**: Do not hardcode or fake precision, recall, execution speed, or funds saved. All metrics are computed dynamically.
5. **Ground Truth Isolation**: `ground_truth.csv` is isolated for evaluation and benchmarking. Detectors never have access to ground truth labels.
6. **Analyst-Centric Vocabulary**: Plain language explanations use banking terms (*account, transfer, connected account, relationship, path*), never graph theory jargon (*graph, node, edge, vertex*).
7. **Synthetic Disclaimer**: Every export and dossier displays the notice: *"Synthetic demonstration data. Not a real case."*
8. **Estimated Savings**: Any money saved via simulated freezing is labelled *"Estimated amount saved: ₹X"*.
9. **Test Integrity**: Never weaken test assertions to pass tests. Fix root causes or document deliberate threshold calibrations.
10. **Student-Friendly Engineering**: Deterministic logic, clean Python & JavaScript, comprehensive inline documentation explaining *why*.

---

### 3. Architecture & Tech Stack
- **Backend**:
  - Python 3.11+
  - FastAPI (REST API & State Store)
  - NetworkX 3.1+ (Temporal Graph traversal & cycle detection)
  - pandas 2.x & NumPy (Data wrangling & feature engineering)
  - PyYAML (Config & thresholds)
  - Pydantic v2 (Data validation)
  - scikit-learn (Analyst feedback learning loop)
  - pytest (Automated testing suite)
- **Frontend**:
  - React 18 (SPA)
  - Vite (Build system)
  - Plain JavaScript with JSDoc typing
  - Zustand (Lightweight store management)
  - Cytoscape.js + CoSE layout (Interactive graph visualization)
  - Lucide React (Clean icon set)
  - Pure CSS with CSS Custom Properties (Themeable design system)
- **Zero Cloud / Zero External API Dependencies**: Fully self-contained, offline-runnable on localhost.

---

### 4. Project Directory Structure
```
muletrace/
├── SPEC.md
├── DECISIONS.md
├── HOW_IT_WORKS.md
├── README.md
├── run.sh
├── run.ps1
├── start.bat
├── backend/
│   ├── __init__.py
│   ├── api.py
│   ├── store.py
│   ├── schemas.py
│   ├── ingest.py
│   ├── graph.py
│   ├── signals.py
│   ├── scoring.py
│   ├── reasons.py
│   ├── taint.py
│   ├── chase.py
│   ├── dossier.py
│   ├── ringdna.py
│   ├── learning.py
│   ├── fraud_engine.py
│   ├── config/
│   │   └── thresholds.yaml
│   ├── detectors/
│   │   ├── __init__.py
│   │   ├── fan_in_out.py
│   │   ├── passthrough.py
│   │   ├── cycles.py
│   │   └── sybil.py
│   ├── evaluation/
│   │   ├── __init__.py
│   │   ├── metrics.py
│   │   ├── evasion.py
│   │   └── bench.py
│   └── tests/
│       ├── __init__.py
│       ├── test_make_data.py
│       ├── test_validation.py
│       ├── test_ingest_graph.py
│       ├── test_fan_in_out.py
│       ├── test_passthrough.py
│       ├── test_cycles.py
│       ├── test_sybil.py
│       ├── test_signals_scoring.py
│       ├── test_taint_freeze.py
│       ├── test_ringdna.py
│       ├── test_learning.py
│       ├── test_api.py
│       ├── test_ground_truth_isolation.py
│       └── test_evasion.py
├── data/
│   ├── make_data.py
│   ├── validate_dataset.py
│   └── demo/
│       ├── transactions.csv
│       ├── accounts.csv
│       └── ground_truth.csv
├── frontend/
│   ├── index.html
│   ├── package.json
│   ├── vite.config.js
│   ├── src/
│   │   ├── main.jsx
│   │   ├── App.jsx
│   │   ├── store/
│   │   │   └── useMuleStore.js
│   │   ├── components/
│   │   │   ├── HeaderNav.jsx
│   │   │   ├── AlertQueue.jsx
│   │   │   ├── GraphCanvas.jsx
│   │   │   ├── InspectorDrawer.jsx
│   │   │   ├── TimelineScrubber.jsx
│   │   │   ├── ChaseListModal.jsx
│   │   │   ├── FreezeChartModal.jsx
│   │   │   ├── SARDossierModal.jsx
│   │   │   ├── RingAutopsyView.jsx
│   │   │   ├── EarlyWarningPanel.jsx
│   │   │   ├── PresetSelector.jsx
│   │   │   ├── MetricsOverlay.jsx
│   │   │   ├── EvasionTestModal.jsx
│   │   │   ├── CommandPalette.jsx
│   │   │   ├── CounterfactualCard.jsx
│   │   │   ├── RingDNAMatchCard.jsx
│   │   │   ├── ConfidenceBadge.jsx
│   │   │   └── ExportButton.jsx
│   │   ├── screens/
│   │   │   ├── WelcomeScreen.jsx
│   │   │   ├── InvestigationScreen.jsx
│   │   │   ├── CaseScreen.jsx
│   │   │   └── LabScreen.jsx
│   │   └── styles/
│   │       ├── tokens.css
│   │       ├── base.css
│   │       └── print.css
└── docs/
    ├── demo_script.md
    ├── pitch.md
    └── qa.md
```

---

### 5. Data Contracts
- **`transactions.csv`**:
  `txn_id,timestamp,source_account,dest_account,amount,channel,device_id,ip_address,source_balance_after,dest_balance_after`
  - Timestamps formatted in ISO 8601 string (`YYYY-MM-DDTHH:MM:SS+05:30` IST).
  - Amount > 0 float.
  - Channel: UPI, IMPS, NEFT.
- **`accounts.csv`**:
  `account_id,display_name,account_type,opened_at,kyc_verified,kyc_pan_hash,kyc_phone_hash,kyc_address_hash,declared_monthly_income,shared_network_tag,device_id,ip_address`
- **`ground_truth.csv`** (Isolated evaluation benchmark):
  `account_id,label,ring_id,ring_type,note`
  - Labels: `mule`, `exit`, `victim`, `legit`, `hard_negative`.

---

### 6. Synthetic Ground Truth Patterns & Hard Negatives
- **Legitimate Look-Alikes (Hard Negatives)**:
  - L1: Merchant Accounts (high daily inflows, single aggregate evening settlement payout).
  - L2: Payroll Accounts (large corporate inflow dispersed to 30–40 employee accounts).
  - L3: Wedding Gift Registry (burst of gifts retained in account).
  - L4: Landlord Rental Collection (monthly rent deposits, negligible immediate forwarding).
  - L5: Family Shared Device (multiple aged accounts sharing a phone/tablet).
  - L6: Peer Reimbursements / Friend Pairs (two accounts sending payments back and forth).
  - L7: Small Online Reseller (moderate forwarding ratio, long tenure, full KYC).
  - L8: Campus Wi-Fi Shared IP (students sharing public IP address without shared devices or PANs).
- **Fraud Rings**:
  - R1: Fan-In/Fan-Out Mule Hub (high-velocity aggregation and rapid single/multi exit transfer).
  - R2: Pass-Through Layering Chain (multi-hop rapid relay keeping negligible residual balance).
  - R3: Circular Transfer Ring (3–5 hop closed cycle with value preservation).
  - R4: Sybil Device/KYC Cluster (newly opened accounts sharing hardware fingerprint & PAN).
  - R5: Composite Scam Flow (victim entry -> multi-layer dispersal -> crypto/ATM exit).
  - R6: Evasion Test Ring (slow-paced transfers designed to test detection sensitivity limits).

---

### 7. Phase Roadmap
- **Phase 0**: Repository inspection and architecture setup.
- **Phase 1**: Project scaffolding and environment setup.
- **Phase 2**: Synthetic dataset generator (`data/make_data.py`).
- **Phase 3**: Dataset validation (`data/validate_dataset.py`).
- **Phase 4**: Graph construction and ingestion engine (`backend/ingest.py`, `backend/graph.py`).
- **Phase 5**: Fan-in/fan-out detector (`backend/detectors/fan_in_out.py`).
- **Phase 6**: Pass-through layering detector (`backend/detectors/passthrough.py`).
- **Phase 7**: Circular transfer detector (`backend/detectors/cycles.py`).
- **Phase 8**: Sybil device/IP/KYC detector (`backend/detectors/sybil.py`).
- **Phase 9**: Behavioral signals, composite scoring, confidence & explanations (`backend/signals.py`, `backend/scoring.py`, `backend/reasons.py`).
- **Phase 10**: Taint tracing, temporal replay, freeze simulation & chase list (`backend/taint.py`, `backend/chase.py`).
- **Phase 11**: Ring autopsy & Ring DNA similarity (`backend/ringdna.py`).
- **Phase 12**: Active learning feedback loop & day-zero early warning (`backend/learning.py`).
- **Phase 13**: Backend FastAPI service & in-memory state store (`backend/api.py`, `backend/store.py`, `backend/fraud_engine.py`).
- **Phase 14**: Frontend shell, theme tokens & command center layout.
- **Phase 15**: Interactive Cytoscape graph canvas & alert queue panel.
- **Phase 16**: Inspector drawer, timeline scrubber, replay animations & SAR dossier modal.
- **Phase 17**: Forensic lab, evaluation metrics & evasion testing screens.
- **Phase 18**: Accessibility, keyboard shortcuts & responsive comfort features.
- **Phase 19**: End-to-end integration tests, benchmarking & demo hardening.
- **Phase 20**: Documentation, demo pitch script & hackathon presentation guide.
