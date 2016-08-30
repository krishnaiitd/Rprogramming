library(data.table)

a=c(rep("Math",3),rep("Phys",3),rep("Chem",2))
b=c("A","B","C","D","E","F","G","H")
c=c(10,20,15,40,23,50,12,90)
df=data.frame(stid=b,dep=a,mks=c)

dt <- as.data.table(df)

rdt <- dt[, mksrank:=rank(-mks, ties.method="first"), by=dep]

print(rdt)
order_rdt <- rdt[order(rdt$dep, -rdt$mks), ]
print(order_rdt)