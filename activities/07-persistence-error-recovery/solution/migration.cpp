Snapshot migrateV1(const Json& doc) {
 Snapshot s; s.limit={doc.at("limit").get<int64_t>()};
 for(const auto& e:doc.at("expenses")) s.expenses.push_back(fromV1(e));
 s.schemaVersion=2; return s;
}
