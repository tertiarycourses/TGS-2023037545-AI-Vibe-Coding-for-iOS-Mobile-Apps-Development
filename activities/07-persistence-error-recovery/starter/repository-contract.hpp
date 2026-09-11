class ExpenseRepository { public: virtual Snapshot load()=0; virtual void save(const Snapshot&)=0; virtual ~ExpenseRepository()=default; };
